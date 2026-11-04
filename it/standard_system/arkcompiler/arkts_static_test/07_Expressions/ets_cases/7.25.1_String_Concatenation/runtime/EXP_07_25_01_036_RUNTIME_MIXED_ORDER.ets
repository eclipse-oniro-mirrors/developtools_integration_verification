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
 * @id EXP_07_25_01_036_RUNTIME_MIXED_ORDER
 * @expect runtime
 * @section 7.25.1
 * @design 验证混合类型拼接的左结合性：1+2+"!" → 先数值加法再拼接
 * @note 运行时用例：+ 是左结合的，1+2+"!" 先做 int+int=3，再拼接 "3!"；"!"+1+2 则先拼接再拼接得 "!12"
 */
function main(): void {
    let r1: string = 1 + 2 + '!';
    if (r1 != '3!') {
    throw new Error('assert 1+2+'!' failed: ' + r1);
  }
  }
  }
  }
    }
    let r2: string = '!' + 1 + 2;
    if (r2 != "!12") {
    throw new Error('assert '!'+1+2 failed: ' + r2);
  }
  }
  }
  }
    }
    let r3: string = 10 + 20 + ' = ' + 30;
    if (r3 != '30 = 30') {
    throw new Error('assert 10+20+' = '+30 failed: ' + r3);
  }
  }
  }
  }
    }
console.log('verified');
}
