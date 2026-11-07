/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
type MixedType_100 = number | boolean | string | null | undefined | (() => void);
enum LoginType100 { pass = '密码登录', code = '验证码登录' }
@Component
struct CompD100 {
  @Consume flag: MixedType_100 | LoginType100 ;

  build() {
    Column() {
      Text(`Local ${this.flag}`)
      Button('refresh')
        .margin(10)
        .onClick(() => {
          const current = this.flag;
          if (typeof current === 'number') {
            this.flag = '文字';
          } else if (typeof current === 'string') {
            this.flag = true;
          } else if (typeof current === 'boolean') {
            this.flag = () => console.log('函数执行');
          } else if (current instanceof Function) {
            this.flag = null;
          } else {
            this.flag = LoginType100.pass; // 枚举值
          }
        })
        .id('btn')
    }
  }
}

@Entry
@Component
struct CompA100 {
  @Provide flag: MixedType_100 | LoginType100 = undefined;

  build() {
    Column() {
      CompD100()
    }
  }
}
