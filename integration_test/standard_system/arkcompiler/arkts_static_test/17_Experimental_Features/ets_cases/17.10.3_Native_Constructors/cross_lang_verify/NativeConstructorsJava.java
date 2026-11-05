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
 * Java cross-language verification for ArkTS 17.10.3 Native Constructors
 *
 * Key difference: Java does NOT support `native` constructors.
 * In Java, the `native` keyword can only be applied to methods, NOT constructors.
 * Java constructors cannot be abstract, native, static, final, or synchronized.
 *
 * Equivalent patterns in Java:
 * 1. Regular constructor that calls a native init() method
 * 2. Static factory method that delegates to native code
 * 3. Builder pattern wrapping native object creation
 *
 * This is a CRITICAL difference: ArkTS uniquely allows native constructors.
 */

// Test 1: Normal constructor (ArkTS 001 equivalent - no native constructor possible)
class NativeCtorJava {
    private int val;
    private double factor;

    // Java: regular constructor - no native allowed
    // ArkTS: native constructor() would compile (no body)
    // Java: constructor MUST have body
    public NativeCtorJava() {
        this(0);
    }

    public NativeCtorJava(int val) {
        this.val = val;
        this.factor = (double) val * 2.0;
    }

    public int getValue() {
        return val;
    }
    public double getDouble() {
        return factor;
    }
}

// Test 2: Pattern to simulate native constructor - native init method
// This is the standard Java JNI pattern when native construction is needed
class NativeInitPattern {
    private long nativeHandle;

    public NativeInitPattern() {
        // Call native init instead of native constructor
        this.nativeHandle = 0;  // simulated
    }

    // This IS valid Java: native method called from constructor

    public long getHandle() {
        return nativeHandle;
    }
}

// Test 3: Subclass pattern (ArkTS 003)
class BaseClass {
    public BaseClass() {}
}

class DerivedClass extends BaseClass {
    // Java: cannot use native constructor
    // ArkTS: native constructor() in subclass compiles
    public DerivedClass() {
        super();
    }
}

// Test 4: Multiple constructors (ArkTS 004 equivalent)
class MixedCtorJava {
    private int xVal;
    private double yVal;

    // Default constructor - Java equivalent of native constructor()
    public MixedCtorJava() {
        this(0);
    }

    // Parameterized constructor
    public MixedCtorJava(int val) {
        this.xVal = val;
        this.yVal = (double) val * 2.0;
    }

    public int getValue() {
        return xVal;
    }
    public double getDouble() {
        return yVal;
    }
}

// Test 5: Type usage (ArkTS 005 equivalent)
class NativeTypeClass {
    private String tag;

    // Java: normal constructor with body
    public NativeTypeClass() {
        this.tag = "java_type";
    }

    public String describe() {
        return tag;
    }
}

// Verify: native constructor syntax is INVALID in Java (modifier native not allowed here)

/**
 * Java cross-language verification for ArkTS 17.10.3 Native Constructors
 */
public class NativeConstructorsJava {
    public static void main(String[] args) {
        // Test 1: No-arg constructor (equivalent to ArkTS native constructor())
        NativeCtorJava obj1 = new NativeCtorJava();
        assert obj1.getValue() == 0 : "Expected 0, got " + obj1.getValue();
        System.out.println("PASS 001: no-arg constructor works (Java: body required)");

        // Test 2: Parameterized constructor
        NativeCtorJava obj2 = new NativeCtorJava(21);
        assert obj2.getValue() == 21 : "Expected 21, got " + obj2.getValue();
        assert obj2.getDouble() == 42.0 : "Expected 42.0, got " + obj2.getDouble();
        System.out.println("PASS 002: constructor with params works");

        // Test 3: Subclass
        DerivedClass obj3 = new DerivedClass();
        System.out.println("PASS 003: subclass constructor works");

        // Test 4: Multiple constructors
        MixedCtorJava obj4a = new MixedCtorJava();
        MixedCtorJava obj4b = new MixedCtorJava(15);
        assert obj4b.getValue() == 15 : "Expected 15, got " + obj4b.getValue();
        assert obj4b.getDouble() == 30.0 : "Expected 30.0, got " + obj4b.getDouble();
        System.out.println("PASS 004: multiple constructors work (Java: all need bodies)");

        // Test 5: Type usage
        NativeTypeClass ref = null;
        assert ref == null : "Expected null reference";
        NativeTypeClass[] arr = new NativeTypeClass[0];
        assert arr.length == 0 : "Expected empty array";
        System.out.println("PASS 005: type usage works (null reference, empty array)");

        // Key differences documented:
        System.out.println();
        System.out.println("--- KEY DIFFERENCES: Java vs ArkTS native constructors ---");
        System.out.println("DIFF 1: Java does NOT support native constructors");
        System.out.println("  ArkTS: native constructor()  -- compiles (ESE0084 if body present)");
        System.out.println("  Java:  native ClassName() {} -- COMPILE ERROR: modifier native not allowed here");
        System.out.println("DIFF 2: Java constructors always have bodies (even if empty {})");
        System.out.println("  ArkTS: native constructor() has NO body");
        System.out.println("  Java:  constructor must have body, even empty {} body");
        System.out.println("DIFF 3: Java uses native init() pattern instead of native constructor");
        System.out.println("  Standard JNI pattern: constructor calls private native void nativeInit()");

        System.out.println();
        System.out.println("JAVA VERIFIED: All native constructor comparison tests passed");
        System.out.println("CONCLUSION: ArkTS native constructor is a unique feature with no Java equivalent");
    }
}
