/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { router } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG = 'Routerpage027';

@Entry
@ComponentV2
export struct Routerpage027 {
  @Local statusInfo: string = '等待检测';
  @Local paramInfo: string = '启动参数：检测中...';
  @Local paramValue: string = '';

  build() {
    Column({ space: 10 }) {
      Text(`测试用例：SUB_ACE_BASICABILITY_ROUTERPAGE_027`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Start)

      Divider()

      Text(`测试步骤：打开DemoHap`)
        .fontSize(13)
        .fontColor(Color.Blue)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`预期结果：首页加载成功，首页能获取到启动参数为null`)
        .fontSize(13)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(this.statusInfo)
        .fontSize(12)
        .fontColor(Color.Orange)
        .width('100%')

      Text(this.paramInfo)
        .fontSize(12)
        .fontColor(Color.Blue)
        .width('100%')

      if (this.paramValue) {
        Text(`参数详情：${this.paramValue}`)
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')
      }

      Divider()

      Column() {
        Text('首页内容区域')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)

        Text('应用正常加载')
          .fontSize(14)
          .margin({ top: 10 })

        Image($r('app.media.icon'))
          .width(100)
          .height(100)
          .margin({ top: 20 })
      }
      .width('100%')
      .layoutWeight(1)
      .justifyContent(FlexAlign.Center)
      .backgroundColor(Color.White)
      .borderRadius(8)
      .padding(20)

      Button('重新检测启动参数')
        .id('btn')
        .width('90%')
        .margin({ top: 10 })
        .onClick(() => {
          try {
            const params = router.getParams();
            if (params === null || params === undefined) {
              this.statusInfo = '✅ 启动参数为null（符合预期）';
              this.paramInfo = '启动参数：null';
              hilog.info(0x0000, TAG, 'Startup params is null');
            } else {
              this.statusInfo = '❌ 启动参数不为null（不符合预期）';
              this.paramInfo = `启动参数：${typeof params}`;
              this.paramValue = JSON.stringify(params);
              hilog.info(0x0000, TAG, `Startup params: ${JSON.stringify(params)}`);
            }
          } catch (error) {
            hilog.error(0x0000, TAG, `getParams error: ${JSON.stringify(error)}`);
          }
        })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F5F5F5')
  }

  aboutToAppear(): void {
    try {
      const params = router.getParams();
      if (params === null || params === undefined) {
        this.statusInfo = '✅ 首页加载成功，启动参数为null（符合预期）';
        this.paramInfo = '启动参数：null';
        hilog.info(0x0000, TAG, 'Startup params is null');
      } else {
        this.statusInfo = '❌ 首页加载成功，但启动参数不为null（不符合预期）';
        this.paramInfo = `启动参数类型：${typeof params}`;
        this.paramValue = JSON.stringify(params);
        hilog.info(0x0000, TAG, `Startup params: ${JSON.stringify(params)}`);
      }
    } catch (error) {
      this.statusInfo = '❌ 获取启动参数失败';
      hilog.error(0x0000, TAG, `getParams error: ${JSON.stringify(error)}`);
    }
  }
}

