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
 * @id SEM_15_11_09_200_RUNTIME_overload_override
 * @expect runtime
 * @section 15.11.9
 * @design 重载覆写交互运行时
 * @note 运行时用例
 */
class B { f(x: int): string { return 'b'; } }
class D extends B { override f(x: int): string { return 'd'; } }
function main(): void { let d: D = new D(); let r = d.f(1); if (r != 'd') {
    throw new Error('fail');
  }
  }
  }
  }
}
console.log('verified');
}
