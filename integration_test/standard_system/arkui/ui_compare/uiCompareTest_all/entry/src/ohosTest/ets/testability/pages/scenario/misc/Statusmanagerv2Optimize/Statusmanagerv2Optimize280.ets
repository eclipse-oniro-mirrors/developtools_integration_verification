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
class InnerClass280 {
  public name: string;
  constructor(name: string) {
    this.name = name;
  }
}

@Entry
@ComponentV2
struct MyComponent280 {
  @Local outerObj:InnerClass280  =  new InnerClass280('初始值') ;

  build() {
    Column() {
      Text(`嵌套类属性: ${this.outerObj.name}`)
      Button('修改嵌套属性')
        .onClick(() => {
          this.outerObj.name = '新值'; // 不会触发UI刷新
        })
        .id('btn1')
    }
  }
}

