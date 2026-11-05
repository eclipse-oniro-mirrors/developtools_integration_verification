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
 * Java equivalent of ArkTS 17.10.2 Native Methods tests.
 * Java uses `native` for JNI methods inside classes.
 */
class NativeMethodBase {
    native String fetchData();
}

class NativeMethodChild extends NativeMethodBase {
    @Override
    String fetchData() {
        return "child implementation";
    }
}

class ServiceWithNative {
    native String platformCall();

    String regularCall() {
        return "regular result";
    }

    int getStatus() {
        return 200;
    }
}

/** Java equivalent of ArkTS 17.10.2 Native Methods tests */
public class NativeMethodTest {
    // PASS: basic native method
    // PASS: static native
    static native void initSystem();

    // PASS: private native
    private native int internalCompute(int data);

    // Generic native method
    // Note: Java doesn't support generic native methods in the same way as ArkTS,
    // but native methods can use generic types in their signature
    native <T> T getValue(String key);

    public static void main(String[] args) {
        // Test 1: Class with native methods can be instantiated
        ServiceWithNative svc = new ServiceWithNative();
        String r1 = svc.regularCall();
        assert "regular result".equals(r1) : "Expected 'regular result' but got " + r1;
        int r2 = svc.getStatus();
        assert r2 == 200 : "Expected 200 but got " + r2;
        System.out.println("native method class works: " + r1 + " " + r2);

        // Test 2: Override native method
        NativeMethodChild child = new NativeMethodChild();
        String result = child.fetchData();
        assert "child implementation".equals(result) : "Expected 'child implementation' but got " + result;
        System.out.println("override works: " + result);

        System.out.println("All Java native method tests passed");
    }
}
