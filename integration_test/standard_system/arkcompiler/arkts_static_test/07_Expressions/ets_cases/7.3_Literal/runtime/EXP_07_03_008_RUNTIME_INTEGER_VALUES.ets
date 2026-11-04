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
 * @id EXP_07_03_008_RUNTIME_INTEGER_VALUES
 * @expect runtime
 * @section 7.3
 * @design 运行时验证整数字面量在不同进制下的值是否正确
 * @note 运行时用例：验证十进制、十六进制、八进制、二进制整数字面量的实际值
 */
function main(): void {
  if (42 != 42) {
    throw new Error('fail');
  }
  }
  }
  }
  }if (0xFF != 255) {
    throw new Error('fail');
  }
  }
  }
  }
  }if (0o77 != 63) {
    throw new Error('fail');
  }
  }
  }
  }
  }if (0b1010 != 10) {
    throw new Error('fail');
  }
  }
  }
  }
  }if (0 != 0) {
    throw new Error('fail');
  }
  }
  }
  }
  }if (-10 != -10) {
    throw new Error('fail');
  }
  }
  }
  }
  }console.log('verified')
}
