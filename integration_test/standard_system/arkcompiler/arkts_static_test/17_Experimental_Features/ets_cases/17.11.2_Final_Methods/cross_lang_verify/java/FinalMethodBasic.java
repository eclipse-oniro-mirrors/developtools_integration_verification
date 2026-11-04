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
 * Java cross-verification: final method basic declaration and inheritance
 * Equivalent to ArkTS 17.11.2 Final Methods compile-pass tests
 */
class Animal {
    public final String identify() {
        return "Animal";
    }
}

class Dog extends Animal {
    // Cannot override identify() because it's final
    // This is valid - just inheriting the final method
    public String bark() {
        return "Woof";
    }
}

/** Java cross-verification: final method basic declaration and inheritance */
public class FinalMethodBasic {
    public static void main(String[] args) {
        Animal a = new Animal();
        assert a.identify().equals("Animal") : "Animal.identify should return 'Animal'";

        Dog d = new Dog();
        assert d.identify().equals("Animal") : "Dog.identify should return 'Animal' via inheritance";
        assert d.bark().equals("Woof") : "Dog.bark should return 'Woof'";

        System.out.println("verified");
    }
}
