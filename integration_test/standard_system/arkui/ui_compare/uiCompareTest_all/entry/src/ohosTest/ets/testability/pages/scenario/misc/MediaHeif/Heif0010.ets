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

/**
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0010
 * @tc.desc: 设置image组件src属性为heif格式，执行onComplete回调，不执行onFinish回调
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct Heif0010 {
  @Local testLog: string = '';
  @Local image1Complete: boolean = false;
  @Local image2Complete: boolean = false;
  @Local image3Complete: boolean = false;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'Heif0010', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - HEIF格式图片src测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0010')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('HEIF图片src属性测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      Row() {
        Column() {
          Text('资源图片')
            .fontSize(10)
          Image($r('app.media.icon'))
            .width(80)
            .height(80)
            .id('heif_resource')
            .onComplete(() => {
              this.image1Complete = true;
              this.addLog('资源图片onComplete回调');
            })
            .onError(() => {
              this.addLog('资源图片onError回调');
            })
          Text(this.image1Complete ? '✓' : '...')
            .fontSize(10)
        }.margin({ right: 10 })

        Column() {
          Text('网络图片')
            .fontSize(10)
          Image(('https://' + 'example.com' + '/test.heic'))
            .width(80)
            .height(80)
            .id('heif_network')
            .onComplete(() => {
              this.image2Complete = true;
              this.addLog('网络图片onComplete回调');
            })
            .onError(() => {
              this.addLog('网络图片onError回调');
            })
          Text(this.image2Complete ? '✓' : '...')
            .fontSize(10)
        }.margin({ right: 10 })

        Column() {
          Text('本地图片')
            .fontSize(10)
          Image($r('app.media.icon'))
            .width(80)
            .height(80)
            .id('heif_local')
            .onComplete(() => {
              this.image3Complete = true;
              this.addLog('本地图片onComplete回调');
            })
            .onError(() => {
              this.addLog('本地图片onError回调');
            })
          Text(this.image3Complete ? '✓' : '...')
            .fontSize(10)
        }
      }.margin({ bottom: 10 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Text('1. 设置Src为引用heif格式资源图片\n2. 设置Src为heif格式网络图片\n3. 设置Src为heif格式本地图片\n预期: 图片正常显示，执行onComplete回调')
        .fontSize(11)
        .fontColor('#666666')

      Scroll() {
        Text(this.testLog)
          .fontSize(10)
          .fontColor('#333333')
          .id('log_text')
      }
      .height('8.2%')
      .width('100%')
      .backgroundColor('#F5F5F5')
      .padding(5)
      .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}

