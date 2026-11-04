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
 * @id EXP2_17_03_014_FAIL_VALUEARRAY_TYPE_PARAMETER
 * @expect compile-fail
 * @section 17.3
 * @design ValueT[] 编译错误：ValueArray 不是泛型类型，不能使用类型参数 T，必须使用具体值类型
 * @note 反向用例：验证该场景应产生编译时错误
 */
function useValueArrayWithTypeParam<T>(elem: T): void {
  let a: ValueT[] = [elem]
  console.log(a[0])
}

function testValueArrayTypeParamFail(): void {
  useValueArrayWithTypeParam<int>(42)
}
