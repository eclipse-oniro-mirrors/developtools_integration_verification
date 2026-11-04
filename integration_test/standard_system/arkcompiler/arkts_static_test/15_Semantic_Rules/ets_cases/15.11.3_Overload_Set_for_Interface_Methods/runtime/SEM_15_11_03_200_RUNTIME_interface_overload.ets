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
 * @id SEM_15_11_03_200_RUNTIME_interface_overload
 * @expect runtime
 * @section 15.11.3
 * @design 接口方法重载运行时
 * @note 运行时用例
 */
interface I { f(x: int): string; }
class C implements I { f(x: int): string { return 'ok'; } }
function main(): void { let c: C = new C(); let r = c.f(1); if (r != 'ok') {
    throw new Error('fail');
  }
  }
  }
  }
  }
console.log('verified');
}
