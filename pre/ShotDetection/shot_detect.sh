#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=59GB
#SBATCH --time=3:00:00
#SBATCH --partition=debug
#SBATCH --account=shrikann_35

module load gcc/11.3.0
eval "$(conda shell.bash hook)"
conda activate /project/shrikann_35/dbose/envs/vlm_sem_seg

cd /project/shrikann_35/dbose/codes/semantic_scene_segmentation/VLM-Sem-Seg/SceneSeg/pre/ShotDetection
python shotdetect_p.py --num_workers 4 --source_path /scratch1/rajatheb/condensed_movies/videos_hq --list_file /project/shrikann_35/dbose/codes/semantic_scene_segmentation/VLM-Sem-Seg/data/Condensed_movies.txt --save_data_root_path /scratch1/dbose/video_scene_boundary_detection/Condensed_Movies_shots --split_video True