/*
 * Copyright (c) 2021-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/**
 * Java equivalent of ArkTS EXP2_17_12_023 - Complex logic in default methods
 * Tests: conditionals, loops, this-like access in default methods
 * Note: Java interfaces cannot have instance fields, so threshold is a static final
 *       or passed as parameter. Here we use an abstract method getThreshold().
 */
interface IDataProcessor {
    /**
     * Get threshold value
     *
     * @return int threshold
     */
    int getThreshold();

    /**
     * Process data array with threshold filtering
     *
     * @param values input array
     * @return int
     */
    default int processData(int[] values) {
        int sum = 0;
        int count = 0;
        int threshold = getThreshold();
        for (int i = 0; i < values.length; i++) {
            int v = values[i];
            if (v > threshold) {
                sum = sum + v;
                count = count + 1;
            }
        }
        if (count > 0) {
            return sum / count;
        } else {
            return 0;
        }
    }

    /**
     * Categorize score into grade
     *
     * @param score input score
     * @return String grade
     */
    default String getCategory(int score) {
        if (score >= 90) {
            return "A";
        } else if (score >= 80) {
            return "B";
        } else if (score >= 70) {
            return "C";
        } else if (score >= 60) {
            return "D";
        } else {
            return "F";
        }
    }
}

class Processor implements IDataProcessor {
    private int threshold = 50;

    public int getThreshold() {
        return threshold;
    }
}

class JavaComplexLogic {
    public static void main(String[] args) {
        Processor proc = new Processor();

        // Test 1: processData
        int[] arr = {10, 60, 20, 80, 30, 100};
        int avg = proc.processData(arr);
        // Values above 50: 60, 80, 100 -> sum=240, count=3, avg=80
        if (avg != 80) {
            throw new AssertionError("FAIL: processData expected 80, got " + avg);
        }

        // Test 2: processData with no values above threshold
        int[] arr2 = {10, 20, 30, 40};
        int avg2 = proc.processData(arr2);
        if (avg2 != 0) {
            throw new AssertionError("FAIL: processData empty match expected 0, got " + avg2);
        }

        // Test 3: getCategory
        String catA = proc.getCategory(95);
        if (!catA.equals("A")) {
            throw new AssertionError("FAIL: getCategory(95) expected A, got " + catA);
        }

        String catF = proc.getCategory(55);
        if (!catF.equals("F")) {
            throw new AssertionError("FAIL: getCategory(55) expected F, got " + catF);
        }

        System.out.println("PASS: complex logic in default methods works correctly");
    }
}
