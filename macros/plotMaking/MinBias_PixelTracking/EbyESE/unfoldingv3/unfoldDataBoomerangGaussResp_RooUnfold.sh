N="$1"
ROOUNFOLD="$2"
rm txt/PbPb_2015/data/*.root
root -l -b<<EOF
gSystem->Load("$ROOUNFOLD/libRooUnfold");
.L UnfoldDataBoomerangGaussResp_DoSys.C++
UnfoldDataBoomerangGaussResp_DoSys($N)
EOF