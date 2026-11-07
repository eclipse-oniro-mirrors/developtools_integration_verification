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

// 定义参数接口
interface PageParam0060 {
  msg?: string;
}

@Entry({ routeName: 'RouterPageOne0060' })
@Component
export struct RouterPageOne0060 {
  @State counter: number = 0;
  private paramMsg: string = '';

  onNewParam(param: Object) {
    console.log(`testTag RouterPageOne0060 onNewParam called with param: ${JSON.stringify(param)}`);
    const pageParam = param as PageParam0060;
    if (pageParam && pageParam.msg) {
      this.paramMsg = pageParam.msg;
      console.log(`testTag RouterPageOne0060 onNewParam successful, param: ${JSON.stringify(param)}`);
    }
  }

  aboutToAppear() {
    this.counter = 0;
  }

  build() {
    Column() {
      Text('RouterPageOne')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 });

      Text(`Counter: ${this.counter}`)
        .fontSize(18)
        .margin({ bottom: 10 });

      if (this.paramMsg) {
        Text(`Param: ${this.paramMsg}`)
          .fontSize(16)
          .fontColor('#007DFF')
          .margin({ bottom: 10 });
      }
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#F5F5F5')
  }
}

