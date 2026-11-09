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
import { router } from '@kit.ArkUI';

@Entry
@Component
struct UiAbilityPage11 {
  @State message: string = 'PageOne';
  @State operationLog: string = '';

  aboutToAppear(): void {
    this.addLog('PageOne aboutToAppear');
  }

  aboutToDisappear(): void {
    this.addLog('PageOne aboutToDisappear');
  }

  onPageShow(): void {
    this.addLog('PageOne OnPageShow');
  }

  onPageHide(): void {
    this.addLog('PageOne OnPageHide');
  }

  addLog(msg: string): void {
    const time = new Date().toLocaleTimeString();
    this.operationLog = `[${time}] ${msg}\n${this.operationLog}`;
  }

  goBack(): void {
    this.addLog('返回上一页');
    router.back();
  }

  build() {
    Column({ space: 15 }) {
      Text(this.message)
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('这是 PageOne 页面')
        .fontSize(16)
        .fontColor(Color.Gray)

      Divider()

      Button('返回')
        .onClick(() => this.goBack())
        .width('80%')
        .backgroundColor('#409EFF')

      Text('页面生命周期日志')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .margin({ top: 20 })

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
      .height('300')
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Auto)
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}

