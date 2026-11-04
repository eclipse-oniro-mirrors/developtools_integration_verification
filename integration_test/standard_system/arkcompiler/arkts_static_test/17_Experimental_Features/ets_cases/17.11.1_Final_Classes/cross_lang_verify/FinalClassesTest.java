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
 * Java cross-language verification for ArkTS 17.11.1 Final Classes
 *
 * Java supports `final class` with identical semantics:
 * - A final class cannot be subclassed (compile-time error)
 * - Methods in a final class are implicitly final (cannot be overridden since no subclassing)
 * - `final` on methods in non-final classes prevents overriding in subclasses
 */

// Test 1: Basic final class (identical to ArkTS)
final class FinalClassJava {
    private int id;
    private String name;

    public FinalClassJava(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }
}

// Test 2: Final class implementing interface (identical to ArkTS)
interface CalculatorJava {
    /**
     * Compute value
     *
     * @param val input value
     * @return int
     */
    int compute(int val);
}

final class FinalCalculatorJava implements CalculatorJava {
    private int multiplier;

    public FinalCalculatorJava(int mult) {
        this.multiplier = mult;
    }

    @Override
    public int compute(int val) {
        return val * multiplier;
    }
}

// Test 3: Non-final class with final method (Java supports this)
class NonFinalBaseJava {
    public final int compute() {
        return 100;
    }
}

/**
 * Java cross-language verification for ArkTS 17.11.1 Final Classes
 */
public class FinalClassesTest {
    public static void main(String[] args) {
        // Test 1: Final class instantiation
        FinalClassJava obj1 = new FinalClassJava(1, "test");
        assert obj1.getId() == 1 : "Expected id 1, got " + obj1.getId();
        assert obj1.getName().equals("test") : "Expected name test, got " + obj1.getName();

        FinalClassJava obj2 = new FinalClassJava(2, "second");
        assert obj2.getId() == 2 : "Expected id 2";

        // Test 2: Final class through interface dispatch
        CalculatorJava calc = new FinalCalculatorJava(3);
        int result = calc.compute(7);
        assert result == 21 : "Expected 21, got " + result;

        CalculatorJava calc2 = new FinalCalculatorJava(5);
        int result2 = calc2.compute(10);
        assert result2 == 50 : "Expected 50, got " + result2;

        // Test 3: Final method in non-final class
        NonFinalBaseJava base = new NonFinalBaseJava();
        assert base.compute() == 100 : "Expected 100, got " + base.compute();

        // Test 4: Type usage
        FinalClassJava ref = null;
        assert ref == null : "Expected null reference";

        System.out.println("JAVA VERIFIED: All final class comparison tests passed");
    }
}
