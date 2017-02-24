N="2"
EBYESE="/home/j550c590/CMSSW_7_5_8_patch2/src/HeavyIonsAnalysis/EbyEAnalysis/macros/plotMaking/MinBias_PixelTracking/EbyESE"

cd $EBYESE/unfoldingv3
for (( SPLIT=0; SPLIT < 10; SPLIT++ ))
do
echo "PROCESSING SPLIT ${SPLIT}"
cp $EBYESE/boomerangPlots/statErrorHandle/v$N/eta2.4/systematicStudies/clusCompatTune/newCCTune1pct/AnalyzerResults/CastleEbyE_Split${SPLIT}.root data/PbPb_2015/data/CastleEbyE.root
cp $EBYESE/boomerangPlots/statErrorHandle/v$N/eta2.4/systematicStudies/clusCompatTune/newCCTune1pct/AnalyzerResults/DDResp/dataDrivenResponseAndPriors_Split${SPLIT}.root DDResp/dataDrivenResponseAndPriors.root
root -l -b<<EOF
gSystem->Load("/home/j550c590/CMSSW_7_5_8_patch2/src/HeavyIonsAnalysis/EbyEAnalysis/macros/unfolding/RooUnfold/libRooUnfold");
.L UnfoldDataBoomerang_JamesUnfold.C++
UnfoldDataBoomerang_JamesUnfold($N)
EOF
cp txt/PbPb_2015/data/data$N.root $EBYESE/boomerangPlots/statErrorHandle/v$N/eta2.4/systematicStudies/clusCompatTune/newCCTune1pct/UnfoldResults/dataResp/data${N}_Split${SPLIT}.root
done

echo "DONE!"