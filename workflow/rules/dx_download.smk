# Define checkpoint to download files of unknown number and names
checkpoint dx_download:
    input:
       token_file = "resources/dx/{run}.tk"
    output:
        bamdir = directory("data/{run}"),
        finish = "data/{run}/{run}_finished.txt"
    conda: "../envs/dxpy.yaml"
    log:
        "logs/dx_download/{run}_dx_download.log"
    shell:
        "( TOKEN=$(cat {input.token_file}); "
        "dx login --token $TOKEN --noprojects; "
        "for file in $(dx find data | grep 'consensus.bam' | grep -o -E 'file-\\w+'); "
        "do dx download $file -f -o {output.bamdir}; "
        "done; "
        "touch {output.finish} ) > {log} 2>&1"

#    params:
#        token = subprocess.run(["cat", {run} + ".tk"],
#                               capture_output=True).stdout.strip().decode("utf-8")
