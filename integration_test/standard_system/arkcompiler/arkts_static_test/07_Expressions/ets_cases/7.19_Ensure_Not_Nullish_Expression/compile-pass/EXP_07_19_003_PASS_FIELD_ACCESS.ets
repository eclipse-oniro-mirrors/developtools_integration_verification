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
 * @id EXP_07_19_003_PASS_FIELD_ACCESS
 * @expect compile-pass
 * @section 7.19
 * @design 验证 ensure-not-nullish 在字段访问上的编译通过
 * @note 正向用例：obj!.field 编译通过，! 在字段访问前确保非空
 */
class MyBox {
    public value: int = 0
}

class Wrapper {
    public inner: MyBox = new MyBox()
}

function testFieldAccessNonNull(): void {
    let b: MyBox | undefined = new MyBox()
    let v: int = b!.value
}

function testFieldAccessChained(): void {
    let w: Wrapper | undefined = new Wrapper()
    let v: int = w!.inner.value
}
