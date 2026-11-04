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
 * Java cross-verification: final method override attempt (should fail)
 * Equivalent to ArkTS compile-fail test 006
 * This file will NOT compile - final methods cannot be overridden in Java either
 */
class Base {
    /**
     * Final method greet
     */
    public final void greet() {
        System.out.println("Base greet");
    }
}

class Derived extends Base {
    // COMPILE ERROR: greet() in Derived cannot override greet() in Base
    // overridden method is final
    /**
     * Override attempt - compile error expected
     */
    public void greet() {
        System.out.println("Derived greet");
    }
}

/**
 * Java cross-verification: final method override attempt
 */
public class FinalMethodOverride {
    public static void main(String[] args) {
        Derived d = new Derived();
        d.greet();
    }
}
