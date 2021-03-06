rule jellyfish_merge:
    input: expand(f"samples/{sample}/jellyfish/{{movie}}.jf", movie=movies)
    output: f"samples/{sample}/jellyfish/{sample}.jf"
    log: f"samples/{sample}/logs/jellyfish/merge/{sample}.log"
    benchmark: f"samples/{sample}/benchmarks/jellyfish/merge/{sample}.tsv"
    conda: "envs/jellyfish.yaml"
    message: "Executing {rule}: Merging per-smrtcell jellyfish counts to create {output}."
    shell: "(jellyfish merge -o {output} {input}) > {log} 2>&1"
