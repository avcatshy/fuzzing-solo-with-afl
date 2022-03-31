pushd `dirname $0` > /dev/null
BASE_DIR=`pwd`
popd > /dev/null
# ================================================================ #

FUZZER=afl-fuzz
TEST_CASES=$BASE_DIR/input
TEST_CASES_Enc=$BASE_DIR/input_enc
#RESULT_DIR=$BASE_DIR/result
RESULT_DIR_Enc=$BASE_DIR/result_enc
TARGET_APP_Dec=$BASE_DIR/JC1Decoder
TARGET_APP_Enc=$BASE_DIR/JC1Encoder



# Clear
#rm -rf $RESULT_DIR_Enc/*
# ================================================================ #

# Do Fuzzing
#$FUZZER -i $TEST_CASES -o $RESULT_DIR -x $DICT_PATH -t 20000 $TARGET_APP @@ tmp.pcm
#$FUZZER -i $TEST_CASES -o $RESULT_DIR  -t 20000  -m none $TARGET_APP @@ tmp.pcm
$FUZZER -i $TEST_CASES_Enc -o $RESULT_DIR_Enc  -t 20000  -m none $TARGET_APP_Enc @@ tmp.bit
# ================================================================ #


