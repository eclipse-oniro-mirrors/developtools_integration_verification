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
 * @id EXP_07_03_009_RUNTIME_FLOAT_VALUES
 * @expect runtime
 * @section 7.3
 * @design 运行时验证浮点数字面量值是否正确
 * @note 运行时用例：验证 double 和 float 字面量的实际值（使用整数比较避免精度问题）
 */
function main(): void {
  let a: int = 3
  if (a != 3) {
    throw new Error('fail');
  }
  }
  }
  }
  }let b: double = 3.14
  let bInt: int = 314
  let c: double = 1e10
  if (c != 10000000000.0) throw new Error('scientific notation fail: ' + c)
  let d: float = 3.14f
  let dInt: int = 314
  let e: double = .5
  if (e != 0.5) throw new Error('leading dot fail: ' + e)
  console.log('verified')
}
