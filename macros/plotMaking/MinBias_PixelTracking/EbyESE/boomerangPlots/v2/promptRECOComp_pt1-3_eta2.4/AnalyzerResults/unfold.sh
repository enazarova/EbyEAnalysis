N="2"
EBYESE="/home/j550c590/CMSSW_7_5_8_patch2/src/HeavyIonsAnalysis/EbyEAnalysis/macros/plotMaking/MinBias_PixelTracking/EbyESE"

cd $EBYESE/unfoldingv4
cp $EBYESE/boomerangPlots/v$N/promptRECOComp_pt1-3_eta2.4/AnalyzerResults/DDResp/dataDrivenResponseAndPriors.root DDResp/dataDrivenResponseAndPriors.root
root -l -b<<EOF
gSystem->Load("/home/j550c590/CMSSW_7_5_8_patch2/src/HeavyIonsAnalysis/EbyEAnalysis/macros/unfolding/RooUnfold/libRooUnfold");
.L UnfoldDataBoomerang_JamesUnfold.C++
UnfoldDataBoomerang_JamesUnfold($N)
EOF
cp txt/PbPb_2015/data/data$N.root $EBYESE/boomerangPlots/v$N/promptRECOComp_pt1-3_eta2.4/UnfoldResults/dataResp/data${N}.root

echo "DONE!"