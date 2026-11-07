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
import { router, UIObserver } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';


interface CallbackInfo {
  context?: string;
  name: string;
  state: string;
  index?: number;
  path?: string;
}

@Entry
@Component
struct UiAbilityPage20 {
  @State message: string = 'SUB_ACE_UI_ABILITY_PAGE_0020';
  @State operationLog: string = '';
  @State callbackDetails: string = '暂无回调信息';
  private observerId: number = -1;

  aboutToAppear(): void {
    this.addLog('Index页面 aboutToAppear');
  }

  onPageShow(): void {
    this.addLog('Index页面 OnPageShow');
  }

  onPageHide(): void {
    this.addLog('Index页面 OnPageHide');
  }

  addLog(msg: string): void {
    const time = new Date().toLocaleTimeString();
    this.operationLog = `[${time}] ${msg}\n${this.operationLog}`;
  }

  observerOn(): void {
    this.addLog('✅ 模拟开启页面监听 (UI对比测试)');
  }


  routerPageOne(): void {
    this.addLog('跳转到 PageOne...');
    router.pushUrl({
      url: 'testability/pages/scenario/misc/UiAbilityPage/UiAbilityPage21'
    }).then(() => {
      this.addLog('跳转成功');
    }).catch((err: BusinessError) => {
      this.addLog(`跳转失败: ${err.message}`);
    });
  }

  build() {
    Column({ space: 15 }) {
      Text(this.message)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('监听回调信息测试')
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Button('observer on')
        .onClick(() => this.observerOn())
        .width('80%')
        .id('btn')

      Button('router pageOne')
        .onClick(() => this.routerPageOne())
        .width('80%')
        .backgroundColor('#67C23A')

      Text('监听回调信息：')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .margin({ top: 20 })

      Text(this.callbackDetails)
        .fontSize(12)
        .fontColor('#409EFF')
        .padding(10)
        .backgroundColor('#ECF5FF')
        .borderRadius(5)
        .width('100%')

      Text('操作日志')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .margin({ top: 15 })

      Scroll() {
        Text(this.operationLog)
          .fontSize(12)
          .fontColor('#666666')
          .width('100%')
          .padding(10)
          .backgroundColor('#F5F5F5')
          .borderRadius(5)
      }
      .width('100%')
      .height('200')
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Auto)

      Text('预期：回调包括context、name、state、index、path')
        .fontSize(12)
        .fontColor(Color.Green)
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
