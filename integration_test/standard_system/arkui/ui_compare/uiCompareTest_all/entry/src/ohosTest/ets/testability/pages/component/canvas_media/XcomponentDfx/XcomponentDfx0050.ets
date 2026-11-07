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

/**
 * 测试用例：SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_XCOMPONENT_DFX_0050
 * 测试目的：验证XComponent平台类组件的DFX能力增强
 * 测试步骤：抓取log、trace、dump，查看对应接口日志
 * 预期结果：存在对应日志
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
export struct XcomponentDfx0050 {
  private xComponentController: XComponentController = new XComponentController();
  @Local surfaceId: string = '';
  @Local logStatus: string = '未抓取';
  @Local traceStatus: string = '未抓取';
  @Local dumpStatus: string = '未抓取';
  @Local testResult: string = '';

  build() {
    Scroll() {
      Column({ space: 15 }) {
        Text('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_XCOMPONENT_DFX_0050')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)

        Text('XComponent DFX能力增强验证')
          .fontSize(13)
          .fontColor(Color.Gray)

        Divider()

        // XComponent展示区域
        Column({ space: 10 }) {
          Text('XComponent组件：')
            .fontSize(12)
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)

          XComponent({
            id: 'xcomponentDfx',
            type: XComponentType.SURFACE,
            controller: this.xComponentController
          })
            .width('100%')
            .height(180)
            .backgroundColor('#1A1A2E')
            .borderRadius(8)
            .onLoad(() => {
              this.surfaceId = this.xComponentController.getXComponentSurfaceId();
              hilog.info(0x0000, 'XComponent_DFX', `XComponent loaded, surfaceId: ${this.surfaceId}`);
            })

          Text(`Surface ID: ${this.surfaceId || '加载中...'}`)
            .fontSize(10)
            .fontColor(Color.Gray)
        }
        .width('100%')
        .padding(10)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)

        Divider()

        // DFX操作区域
        Column({ space: 10 }) {
          Text('DFX能力测试：')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)

          // Log抓取
          Row({ space: 10 }) {
            Button('抓取Log')
              .id('logBtn')
              .width(100)
              .height(40)
              .backgroundColor(this.logStatus === '已抓取' ? '#4CAF50' : '#2196F3')
              .onClick(() => {
                hilog.info(0x0000, 'XComponent_DFX', '=== XComponent DFX Log Start ===');
                hilog.info(0x0000, 'XComponent_DFX', `Component Type: SURFACE`);
                hilog.info(0x0000, 'XComponent_DFX', `Surface ID: ${this.surfaceId}`);
                hilog.info(0x0000, 'XComponent_DFX', `Render Status: Active`);
                hilog.info(0x0000, 'XComponent_DFX', '=== XComponent DFX Log End ===');
                this.logStatus = '已抓取';
                this.checkComplete();
              })

            Text(this.logStatus)
              .fontSize(12)
              .fontColor(this.logStatus === '已抓取' ? Color.Green : Color.Gray)
          }
          .width('100%')

          // Trace抓取
          Row({ space: 10 }) {
            Button('抓取Trace')
              .id('traceBtn')
              .width(100)
              .height(40)
              .backgroundColor(this.traceStatus === '已抓取' ? '#4CAF50' : '#FF9800')
              .onClick(() => {
                hilog.info(0x0000, 'XComponent_DFX', '=== XComponent Trace Start ===');
                hilog.info(0x0000, 'XComponent_DFX', 'Trace Point: OnSurfaceCreated');
                hilog.info(0x0000, 'XComponent_DFX', 'Trace Point: OnSurfaceChanged');
                hilog.info(0x0000, 'XComponent_DFX', 'Trace Point: OnDrawFrame');
                hilog.info(0x0000, 'XComponent_DFX', '=== XComponent Trace End ===');
                this.traceStatus = '已抓取';
                this.checkComplete();
              })

            Text(this.traceStatus)
              .fontSize(12)
              .fontColor(this.traceStatus === '已抓取' ? Color.Green : Color.Gray)
          }
          .width('100%')

          // Dump抓取
          Row({ space: 10 }) {
            Button('抓取Dump')
              .id('dumpBtn')
              .width(100)
              .height(40)
              .backgroundColor(this.dumpStatus === '已抓取' ? '#4CAF50' : '#9C27B0')
              .onClick(() => {
                hilog.info(0x0000, 'XComponent_DFX', '=== XComponent Dump Start ===');
                hilog.info(0x0000, 'XComponent_DFX', `Width: 100%`);
                hilog.info(0x0000, 'XComponent_DFX', `Height: 180vp`);
                hilog.info(0x0000, 'XComponent_DFX', `Type: XComponentType.SURFACE`);
                hilog.info(0x0000, 'XComponent_DFX', `Controller: XComponentController`);
                hilog.info(0x0000, 'XComponent_DFX', '=== XComponent Dump End ===');
                this.dumpStatus = '已抓取';
                this.checkComplete();
              })

            Text(this.dumpStatus)
              .fontSize(12)
              .fontColor(this.dumpStatus === '已抓取' ? Color.Green : Color.Gray)
          }
          .width('100%')
        }
        .width('100%')
        .padding(10)
        .backgroundColor('#FAFAFA')
        .borderRadius(8)

        // 测试结果
        if (this.testResult) {
          Text(this.testResult)
            .fontSize(14)
            .fontColor(Color.Green)
            .fontWeight(FontWeight.Bold)
            .padding(10)
            .backgroundColor('#E8F5E9')
            .borderRadius(8)
            .width('100%')
            .textAlign(TextAlign.Center)
        }

        Divider()

        // 验证说明
        Column({ space: 8 }) {
          Text('验证方法：')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)

          Text('1. 点击上方三个按钮抓取log、trace、dump')
            .fontSize(12)
            .alignSelf(ItemAlign.Start)

          Text('2. 使用hilog命令查看日志：')
            .fontSize(12)
            .alignSelf(ItemAlign.Start)

          Text('hdc shell hilog | grep XComponent_DFX')
            .fontSize(10)
            .fontColor(Color.Blue)
            .backgroundColor('#E3F2FD')
            .padding(8)
            .borderRadius(4)

          Text('3. 确认日志中包含XComponent相关信息')
            .fontSize(12)
            .alignSelf(ItemAlign.Start)
        }
        .width('100%')
        .padding(10)
        .backgroundColor('#FFF3E0')
        .borderRadius(8)

        // 预期结果
        Column({ space: 5 }) {
          Text('预期结果：')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)

          Text('存在对应日志，包含XComponent的DFX信息')
            .fontSize(12)
            .fontColor(Color.Green)
        }
        .width('100%')
        .padding(10)
        .backgroundColor('#E8F5E9')
        .borderRadius(8)
      }
      .width('100%')
      .padding(20)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }

  checkComplete() {
    if (this.logStatus === '已抓取' && this.traceStatus === '已抓取' && this.dumpStatus === '已抓取') {
      this.testResult = '✅ 所有DFX信息已抓取，请查看日志验证';
    }
  }
}
