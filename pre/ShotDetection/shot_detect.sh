#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=64
#SBATCH --time=48:00:00
#SBATCH --partition=epyc-64
#SBATCH --account=shrikann_35

module load gcc/11.3.0
module load libxext/1.3.4
module load ffmpeg/6.0
eval "$(conda shell.bash hook)"
conda activate /project/shrikann_35/dbose/envs/vlm_sem_seg

cd /project/shrikann_35/dbose/codes/video_scene_boundary_detection/VLM-Sem-Seg/SceneSeg/pre/ShotDetection
python shotdetect_p.py --num_workers 8 --list_file /project/shrikann_35/dbose/codes/video_scene_boundary_detection/VLM-Sem-Seg/file_shards/remaining_file_path_list.txt --save_data_root_path /scratch1/dbose/video_scene_boundary_detection/Condensed_Movies_shots/SceneSeg --split_video