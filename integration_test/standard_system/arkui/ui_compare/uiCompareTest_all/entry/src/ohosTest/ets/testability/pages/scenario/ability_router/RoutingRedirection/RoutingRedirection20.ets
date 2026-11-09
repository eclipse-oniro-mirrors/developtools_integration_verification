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
struct RoutingRedirection20 {
  @State message: string = 'Router Redirection Test 0020';
  @State operationLog: string = '';
  @State packageInfo: string = '当前：Package A (主包)';

  aboutToAppear() {
    this.addLog('Package A 页面初始化完成');
    this.addLog('测试场景：A包拉起B包页面，跨包路由跳转');
  }

  addLog(msg: string) {
    const time = new Date().toLocaleTimeString();
    this.operationLog = `[${time}] ${msg}\n${this.operationLog}`;
  }

  launchPackageB() {
    this.addLog('尝试从 Package A 拉起 Package B 页面...');
    // 模拟跨包路由
    router.pushUrl({
      url: 'testability/pages/scenario/ability_router/RoutingRedirection/RoutingRedirection20',
      params: {
        fromPackage: 'PackageA',
        toPackage: 'PackageB',
        crossPackage: true
      }
    }).then(() => {
      this.addLog('成功拉起 Package B 页面');
      this.addLog('预期：NotifyPageHide 日志已上报');
      this.packageInfo = '已跳转到：Package B';
    }).catch((err: Error) => {
      this.addLog(`跨包跳转失败: ${err.message}`);
    });
  }

  build() {
    Column({ space: 15 }) {
      Text(this.message)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('SUB_ACE_Routing_redirection_0020')
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Text('测试说明')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .alignSelf(ItemAlign.Start)

      Text('两个hap包之间相互跳转，A包拉起B包页面')
        .fontSize(14)
        .margin({ bottom: 10 })

      Text(this.packageInfo)
        .fontSize(14)
        .fontColor('#409EFF')
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 10 })

      Button('A包拉起B包页面')
        .onClick(() => this.launchPackageB())
        .width('80%')
        .backgroundColor('#67C23A')
        .id('btn')

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
      .height('200')
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Auto)

      Text('预期结果：成功上报页面路径给元能力')
        .fontSize(14)
        .fontColor(Color.Green)
        .margin({ top: 20 })

      Text('验证方式：hilog | grep NotifyPageHide')
        .fontSize(12)
        .fontColor('#909399')
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}

