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
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct UiAbilityPage10 {
  @State message: string = 'SUB_ACE_UI_ABILITY_PAGE_0010';
  @State operationLog: string = '';
  @State isObserverOn: boolean = false;
  private observerId: number = -1;

  aboutToAppear(): void {
    this.addLog('Index页面 aboutToAppear');
  }

  aboutToDisappear(): void {
    this.addLog('Index页面 aboutToDisappear');
    if (this.isObserverOn) {
      this.observerOff();
    }
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
    this.isObserverOn = true;
    this.addLog('✅ 模拟开启页面监听 (UI对比测试)');
  }


  observerOff(): void {
    if (!this.isObserverOn) {
      this.addLog('监听未开启');
      return;
    }
    this.isObserverOn = false;
    this.addLog('✅ 模拟关闭页面监听');
  }

   

  routerPageOne(): void {
    this.addLog('执行路由跳转到 UiAbilityPage11...');
    router.pushUrl({
      url: 'testability/pages/scenario/misc/UiAbilityPage/UiAbilityPage11'
    }).then(() => {
      this.addLog('跳转成功');
    }).catch((err: BusinessError) => {
      this.addLog(`跳转失败: ${err.message}`);
    });
  }

  routerIndex(): void {
    this.addLog('返回上一页...');
    router.back();
  }

  build() {
    Column({ space: 15 }) {
      Text(this.message)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('observer.on/off 开启/关闭监听pages页面生命周期')
        .fontSize(14)
        .fontColor(Color.Gray)
        .textAlign(TextAlign.Center)

      Divider()

      Row({ space: 10 }) {
        Text('监听状态:')
          .fontSize(16)
        Text(this.isObserverOn ? '已开启' : '已关闭')
          .fontSize(16)
          .fontColor(this.isObserverOn ? Color.Green : Color.Red)
          .fontWeight(FontWeight.Bold)
      }

      Button('observer on')
        .onClick(() => this.observerOn())
        .width('80%')
        .id('btn')
        .enabled(!this.isObserverOn)
        .backgroundColor(this.isObserverOn ? '#CCCCCC' : '#409EFF')

      Button('observer off')
        .onClick(() => this.observerOff())
        .width('80%')
        .backgroundColor(this.isObserverOn ? '#E6A23C' : '#CCCCCC')
        .enabled(this.isObserverOn)

      Button('router pageOne')
        .onClick(() => this.routerPageOne())
        .width('80%')
        .backgroundColor('#67C23A')

      Button('router Index')
        .onClick(() => this.routerIndex())
        .width('80%')
        .backgroundColor('#909399')

      Text('操作日志')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .alignSelf(ItemAlign.Start)
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
      .height('250')
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Auto)

      Text('预期：监听页面生命周期，记录OnPageShow/Hide、aboutToAppear/Disappear事件')
        .fontSize(12)
        .fontColor(Color.Green)
        .margin({ top: 10 })
        .textAlign(TextAlign.Center)
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
