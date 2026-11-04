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
 * @id SEM_15_13_01_200_RUNTIME_STATIC_INIT
 * @expect runtime
 * @section 15.13.1
 * @design 验证静态初始化运行时顺序：静态字段按声明顺序初始化
 * @note 运行时用例：静态字段引用的值在运行时正确
 */
class Config {
    public static base: int = 10;
    public static derived: int = Config.base * 2;
}
function main(): void {
    let v: int = Config.derived;
    if (v != 20) {
    throw new Error('assertion failed: ' + v.toString());
  }
  }
  }
  } 
}
console.log('verified');
}
