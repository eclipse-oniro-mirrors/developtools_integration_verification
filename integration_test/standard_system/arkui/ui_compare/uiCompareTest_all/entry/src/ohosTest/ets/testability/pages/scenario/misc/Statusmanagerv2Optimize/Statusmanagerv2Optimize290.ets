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
@ObservedV2
class InnerClass {
  public name: string;
  @Trace len:number ;
  constructor(name: string,len : number) {
    this.name = name;
    this.len = len;
  }
}

@Entry
@ComponentV2
struct MyComponent {
  @Local outerObj:InnerClass  =  new InnerClass('初始值',3) ;

  build() {
    Column() {
      Text(`嵌套类属性: ${this.outerObj.name}`)
      Text(`嵌套类属性: ${this.outerObj.len}`)
      Button('修改嵌套属性')
        .onClick(() => {
          this.outerObj.name = '新值'; // 不会触发UI刷新
          this.outerObj.len = 2;
        })
        .id('btn1')
    }
  }
}

