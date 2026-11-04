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
 * @id SEM_15_10_03_200_RUNTIME_ctor_overload
 * @expect runtime
 * @section 15.10.3
 * @design 构造函数重载运行时
 * @note 运行时用例
 */
class C { public v: string = ''; constructor(x: int) { this.v = 'i'; } constructor(x: string) { this.v = 's'; } }
function main(): void { let c: C = new C(1); if (c.v != 'i') {
    throw new Error('fail');
  }
  }
  }
  }
  }
console.log('verified');
}
