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
 * @id EXP_07_11_04_010_RUNTIME_INSTANCE_RETURN_VALUE
 * @expect runtime
 * @section 7.11.4
 * @design 验证 instance 方法返回值运行时正确性
 * @note 运行时用例：验证实例方法返回 string 值运行时正确
 */
class Greeter {
  greet(name: string): string {
    return 'Hello, ' + name;
  }
}

function main(): void {
  let g: Greeter = new Greeter();
  let msg: string = g.greet('ArkTS');
  if (msg != 'Hello, ArkTS') {
    throw new Error('assertion failed: expected 'Hello, ArkTS', got ' + msg);
  }
  }
  }
  }
  }
console.log('verified');
}
