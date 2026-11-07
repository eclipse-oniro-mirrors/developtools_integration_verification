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

// 父组件
@Entry
@ComponentV2
struct Index70 {
  @Local count: number|null = null;
  @Local message: string|undefined = undefined;
  @Local flag: boolean = false;
  build() {
    Column() {
      Text(`Local ${this.count}`)
      Text(`Local ${this.message}`)
      Text(`Local ${this.flag}`)
      Button('change Local')
        .onClick(()=>{
          // 对数据源的更改会同步给子组件
          if(!this.count) {
            this.count=0;
          }
          if(!this.message) {
            this.message='hello'
          }
          this.flag = !this.flag;
        })
        .id('btn')
      Child70({
        count: this.count,
        message: this.message,
        flag: this.flag
      })
    }
  }
}
@ComponentV2
struct Child70 {
  @Require @Param count: number|null;
  @Require @Param message: string|undefined;
  @Require @Param flag: boolean;
  build() {
    Column() {
      Text(`Param ${this.count}`)
      Text(`Param ${this.message}`)
      Text(`Param ${this.flag}`)
    }
  }
}
