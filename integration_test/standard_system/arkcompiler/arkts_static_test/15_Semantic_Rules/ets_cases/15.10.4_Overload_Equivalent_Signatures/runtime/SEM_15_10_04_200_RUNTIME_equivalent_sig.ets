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
 * @id SEM_15_10_04_200_RUNTIME_equivalent_sig
 * @expect runtime
 * @section 15.10.4
 * @design 等价签名运行时
 * @note 运行时用例
 */
function foo(x: int): string { return 'i'; }
function main(): void { let r = foo(1); if (r != 'i') {
    throw new Error('fail');
  }
  }
  }
  }
  }
console.log('verified');
}
