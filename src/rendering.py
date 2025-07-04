import sys
import open3d_viz_overlay

pred_file_path = sys.argv[1]
gt_npz_filepath = sys.argv[2]
vis_vid_name = sys.argv[3]
handedness = sys.argv[4]

open3d_viz_overlay.vis_opt_results(pred_file_path=pred_file_path, 
                                   gt_file_path=gt_npz_filepath,
                                   img_dir=vis_vid_name,
                                   flip_flag=handedness == "left")