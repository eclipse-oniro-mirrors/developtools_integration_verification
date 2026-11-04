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
 * Java equivalent for ArkTS 17.14 Trailing Lambdas
 * Java does NOT have trailing lambda syntax - lambdas must be inside parentheses.
 * This demonstrates the closest Java equivalent.
 *
 * @since 2025
 */
public class JavaTrailingLambda {

    // === Equivalent to ArkTS: function runCallback(callback: () => void): void ===
    static void runCallback(Runnable callback) {
        callback.run();
    }

    // === With parameters (equivalent to ArkTS multi-param trailing lambda) ===
    static void processWithPrefix(String prefix, Runnable callback) {
        System.out.println(prefix);
        callback.run();
    }

    // === With return value (equivalent to ArkTS trailing lambda returning value) ===
    interface IntSupplier {
        /**
         * Get int value
         *
         * @return int value
         */
        int get();
    }
    static void computeAndStore(IntSupplier callback) {
        int result = callback.get();
        System.out.println("result: " + result);
    }

    public static void main(String[] args) {
        // ArkTS trailing lambda:  runCallback() { console.log("hello") }
        // Java equivalent: lambda inside parentheses
        runCallback(() -> {
            System.out.println("lambda inside parens");
        });

        // ArkTS: processWithPrefix("test") { console.log("done") }
        // Java: lambda inside parentheses
        processWithPrefix("test", () -> {
            System.out.println("done");
        });

        // ArkTS: compute() { return 42 }
        // Java: lambda inside parentheses
        computeAndStore(() -> {
            return 42;
        });

        System.out.println("Java: all lambdas verified (no trailing syntax available)");
    }
}
