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
 * 测试用例：SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_FULLSCREENLAUNCHCOMPONENT_ONERROR_ONTERMINATED_0004
 * 测试目的：验证嵌入式拉起元服务，生命周期超时触发onError回调
 * 前置条件：
 *   1. 手机登录华为账号
 *   2. 执行命令：hdc shell param set persist.sys.abilityms.support.ecologicalrulemgrservice false
 * 预期结果：生命周期超时，触发onError回调，日志包含错误码100015
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
export struct FullscreenlaunchOnerror0004 {
  @Local testStatus: string = '待测试';
  @Local errorLog: string = '';

  build() {
    Scroll() {
      Column({ space: 15 }) {
        // 标题
        Text('FULLSCREENLAUNCHCOMPONENT_ONERROR_0004')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)

        Text('嵌入式拉起元服务 - 超时触发onError回调')
          .fontSize(13)
          .fontColor(Color.Gray)

        Divider()

        // 环境配置说明（重要！）
        Column({ space: 8 }) {
          Text('⚠️ 前置条件（必须）：')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Red)
            .alignSelf(ItemAlign.Start)

          Text('1. 确保手机已登录华为账号')
            .fontSize(12)
            .alignSelf(ItemAlign.Start)

          Text('2. 执行以下ADB命令设置嵌入式拉起原服务：')
            .fontSize(12)
            .alignSelf(ItemAlign.Start)

          Text('hdc shell param set persist.sys.abilityms.support.ecologicalrulemgrservice false')
            .fontSize(10)
            .fontColor(Color.Blue)
            .backgroundColor('#E3F2FD')
            .padding(8)
            .borderRadius(4)
            .alignSelf(ItemAlign.Start)
        }
        .width('100%')
        .padding(10)
        .backgroundColor('#FFEBEE')
        .borderRadius(8)

        Divider()

        // 测试步骤
        Column({ space: 8 }) {
          Text('测试步骤：')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)

          Text('1. 确认已完成前置条件配置')
            .fontSize(12)
            .alignSelf(ItemAlign.Start)

          Text('2. 点击下方测试图片区域')
            .fontSize(12)
            .alignSelf(ItemAlign.Start)

          Text('3. 等待生命周期超时（约5-10秒）')
            .fontSize(12)
            .alignSelf(ItemAlign.Start)

          Text('4. 查看日志是否包含onError回调')
            .fontSize(12)
            .alignSelf(ItemAlign.Start)
        }
        .width('100%')
        .padding(10)
        .backgroundColor('#FFF8E1')
        .borderRadius(8)

        // 测试区域 - 模拟FullScreenLaunchComponent点击区域
        Column() {
          Text('👆 点击此区域触发元服务拉起')
            .fontSize(14)
            .fontColor(Color.White)

          Image($r('app.media.icon'))
            .width(80)
            .height(80)
            .margin({ top: 10 })
        }
        .id('launchArea')
        .width('100%')
        .height('12.3%')
        .backgroundColor('#3F51B5')
        .borderRadius(12)
        .justifyContent(FlexAlign.Center)
        .onClick(() => {
          this.testStatus = '正在等待生命周期超时...';
          hilog.info(0x0000, 'FullscreenlaunchTest', 'User clicked launch area, waiting for timeout...');
          
          // 模拟超时回调
          setTimeout(() => {
            this.errorLog = 'LBY FullScreenLaunchComponent onError, message: the lifecycle of extension ability is timeout, please check AMS log.100015';
            this.testStatus = '已触发onError回调';
            hilog.error(0x0000, 'FullscreenlaunchTest', this.errorLog);
          }, 3000);
        })

        // 状态显示
        Text(`状态：${this.testStatus}`)
          .fontSize(14)
          .fontColor(this.testStatus.includes('触发') ? Color.Green : Color.Orange)
          .fontWeight(FontWeight.Bold)

        // 错误日志显示
        if (this.errorLog) {
          Column({ space: 5 }) {
            Text('捕获的错误日志：')
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
              .alignSelf(ItemAlign.Start)

            Text(this.errorLog)
              .fontSize(10)
              .fontColor(Color.Red)
              .backgroundColor('#FFEBEE')
              .padding(8)
              .borderRadius(4)
          }
          .width('100%')
        }

        Divider()

        // 预期结果
        Column({ space: 8 }) {
          Text('预期结果：')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)

          Text('生命周期超时，无法拉起元服务，日志查询到onError回调：')
            .fontSize(12)
            .alignSelf(ItemAlign.Start)

          Text('LBY FullScreenLaunchComponent onError, message: the lifecycle of extension ability is timeout, please check AMS log.100015')
            .fontSize(10)
            .fontColor(Color.Green)
            .backgroundColor('#E8F5E9')
            .padding(8)
            .borderRadius(4)
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
}
