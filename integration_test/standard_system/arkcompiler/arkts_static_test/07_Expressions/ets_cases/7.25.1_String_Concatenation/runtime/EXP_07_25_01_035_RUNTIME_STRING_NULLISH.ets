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
 * @id EXP_07_25_01_035_RUNTIME_STRING_NULLISH
 * @expect runtime
 * @section 7.25.1
 * @design 验证 string + null/undefined 运行时拼接结果正确
 * @note 运行时用例：null→"null", undefined→"undefined" 字符串转换
 */
function main(): void {
    let r1: string = 'a' + null;
    if (r1 != 'anull') {
    throw new Error('assert failed: ' + r1);
  }
  }
  }
  }
    }
    let r2: string = 'b' + undefined;
    if (r2 != 'bundefined') {
    throw new Error('assert failed: ' + r2);
  }
  }
  }
  }
    }
    let x: string | null | undefined = null;
    let r3: string = 'val=' + x;
    if (r3 != 'val=null') {
    throw new Error('assert failed: ' + r3);
  }
  }
  }
  }
    }
    x = undefined;
    let r4: string = 'val=' + x;
    if (r4 != 'val=undefined') {
    throw new Error('assert failed: ' + r4);
  }
  }
  }
  }
    }
console.log('verified');
}
