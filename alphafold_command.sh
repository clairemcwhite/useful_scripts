fasta=$1

# Maybe CUDA_VISIBLE_DEVICES='0,1,2,3' also?
# Not sure about this NVIDIA_VISIBLE_DEVICES='0,1,2,3'. Not running on multgpu
singularity run --env NVIDIA_VISIBLE_DEVICES='0',TF_FORCE_UNIFIED_MEMORY=1,XLA_PYTHON_CLIENT_MEM_FRACTION=4.0,OPENMM_CPU_THREADS=8 -B /scratch/gpfs/cmcwhite/alphafold_data:/data -B .:/etc --pwd /app/alphafold --nv /scratch/gpfs/cmcwhite/alphafold_latest.sif \
--fasta_paths /scratch/gpfs/cmcwhite/cplane/$fasta \
--output_dir /scratch/gpfs/cmcwhite/cplane/output_alphafold/ \
--data_dir /data/ \
--uniref90_database_path /data/uniref90/uniref90.fasta \
--mgnify_database_path /data/mgnify/mgy_clusters_2018_12.fa \
--small_bfd_database_path /data/small_bfd/bfd-first_non_consensus_sequences.fasta \
--pdb70_database_path /data/pdb70/pdb70 \
--template_mmcif_dir /data/pdb_mmcif/mmcif_files \
--obsolete_pdbs_path /data/pdb_mmcif/obsolete.dat \
--max_template_date=2021-08-21 \
--model_names model_1,model_2,model_3,model_4,model_5 \
--preset reduced_dbs
