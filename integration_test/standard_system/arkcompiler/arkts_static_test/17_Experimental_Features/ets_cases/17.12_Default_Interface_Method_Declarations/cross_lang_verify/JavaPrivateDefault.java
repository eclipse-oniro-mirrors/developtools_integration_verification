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
 * Java equivalent of ArkTS EXP2_17_12_003 - Private default method
 * Tests: private default method called from another default method
 * Requires Java 9+
 */
interface IMath {
    /**
     * Compute sum via private add
     *
     * @param a first addend
     * @param b second addend
     * @return int sum
     */
    default int compute(int a, int b) {
        return add(a, b);
    }

    /**
     * Compute product via repeated add
     *
     * @param a multiplicand
     * @param b multiplier
     * @return int product
     */
    default int multiply(int a, int b) {
        int result = 0;
        for (int i = 0; i < b; i++) {
            result = add(result, a);
        }
        return result;
    }

    /**
     * Private add helper
     *
     * @param a first
     * @param b second
     * @return int
     */
    private int add(int a, int b) {
        return a + b;
    }

    /**
     * Private subtract helper
     *
     * @param a first
     * @param b second
     * @return int
     */
    private int subtract(int a, int b) {
        return a - b;
    }
}

class Calculator implements IMath {
}

class JavaPrivateDefault {
    public static void main(String[] args) {
        Calculator c = new Calculator();
        int sum = c.compute(3, 4);
        if (sum != 7) {
            throw new AssertionError("FAIL: expected 7, got " + sum);
        }
        int prod = c.multiply(3, 5);
        if (prod != 15) {
            throw new AssertionError("FAIL: expected 15, got " + prod);
        }
        System.out.println("PASS: sum=" + sum + ", product=" + prod);
    }
}
