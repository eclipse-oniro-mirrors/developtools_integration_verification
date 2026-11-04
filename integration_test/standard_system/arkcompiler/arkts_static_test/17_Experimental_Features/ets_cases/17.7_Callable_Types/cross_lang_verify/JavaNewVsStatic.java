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
 * Java: Verify that new C() calls constructor, not static method.
 * This is the natural Java behavior and matches ArkTS spec:
 * "new C(args) calls constructor, not $_invoke/$_instantiate"
 */
class NewVsStatic {
    String tag;

    NewVsStatic() {
        this.tag = "constructed";
    }

    static NewVsStatic create() {
        NewVsStatic obj = new NewVsStatic();
        obj.tag = "invoked";
        return obj;
    }
}

/** Java: Verify new vs static distinction */
public class JavaNewVsStatic {
    public static void main(String[] args) {
        // new always calls constructor
        NewVsStatic objNew = new NewVsStatic();
        assert objNew.tag.equals("constructed") : "new should use constructor";

        // static method call
        NewVsStatic objCall = NewVsStatic.create();
        assert objCall.tag.equals("invoked") : "static method should set invoked";

        System.out.println("PASS: new vs static method distinction verified");
    }
}
