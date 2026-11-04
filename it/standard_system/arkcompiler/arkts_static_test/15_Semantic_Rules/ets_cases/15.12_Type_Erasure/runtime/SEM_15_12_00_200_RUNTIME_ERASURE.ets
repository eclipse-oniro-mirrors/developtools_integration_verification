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
 * @id SEM_15_12_00_200_RUNTIME_ERASURE
 * @expect runtime
 * @section 15.12
 * @design 验证泛型类型擦除运行时行为：擦除后类型信息不影响运行时
 * @note 运行时用例：泛型函数在类型擦除后运行时正确
 */
class Holder<T> { public val: T | undefined; }
function identity<T>(x: T): T { return x; }
function main(): void {
    let r: int = identity<int>(42);
    if (r != 42) {
    throw new Error('assertion failed');
  }
  }
  }
  } 
}
console.log('verified');
}
