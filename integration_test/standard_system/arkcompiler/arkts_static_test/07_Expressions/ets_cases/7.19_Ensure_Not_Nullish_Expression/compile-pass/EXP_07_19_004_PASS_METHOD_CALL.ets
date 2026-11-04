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
 * @id EXP_07_19_004_PASS_METHOD_CALL
 * @expect compile-pass
 * @section 7.19
 * @design 验证 ensure-not-nullish 在方法调用上的编译通过
 * @note 正向用例：obj!.method() 编译通过，! 在方法调用前确保非空
 */
class Calc {
    getValue(): int {
        return 42
    }
}

class Factory {
    makeCalc(): Calc {
        return new Calc()
    }
}

function testMethodCallNonNull(): void {
    let c: Calc | undefined = new Calc()
    let v: int = c!.getValue()
}

function testMethodCallChained(): void {
    let f: Factory | undefined = new Factory()
    let v: int = f!.makeCalc().getValue()
}
