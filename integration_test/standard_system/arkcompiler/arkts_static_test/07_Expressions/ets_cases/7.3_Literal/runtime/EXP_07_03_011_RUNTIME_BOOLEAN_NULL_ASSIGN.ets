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
 * @id EXP_07_03_011_RUNTIME_BOOLEAN_NULL_ASSIGN
 * @expect runtime
 * @section 7.3
 * @design 运行时验证布尔、null、undefined 字面量的使用
 * @note 运行时用例：验证 Boolean 字面量 true/false 和 null/undefined 的基本运行时行为
 */
function main(): void {
  let t: boolean = true
  let f: boolean = false
  if (t != true) {
    throw new Error('fail');
  }
  }
  }
  }
  }if (f != false) {
    throw new Error('fail');
  }
  }
  }
  }
  }if (!t) {
    throw new Error('fail');
  }
  }
  }
  }
  }if (f) {
    throw new Error('fail');
  }
  }
  }
  }
  }console.log('verified')
}
