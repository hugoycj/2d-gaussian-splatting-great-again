data=$1
postix=gaustudio_wnormal
gs-init -s $data -o ${data}_${postix} --pcd combined
python scripts/generate_normals.py -s ${data}_${postix}
rm -r ${data}_${postix}/result
python train.py -s ${data}_${postix} --iteration 20000 \
                -m ${data}_${postix}/result --w_normal_prior normals