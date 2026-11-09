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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0020
 * @tc.desc: 设置image组件alt属性为heif格式，执行onError回调
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct Heif0020 {
  @Local testLog: string = '';
  @Local alt1Shown: boolean = false;
  @Local alt2Shown: boolean = false;
  @Local alt3Shown: boolean = false;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'Heif0020', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - HEIF格式alt占位图测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0020')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('HEIF图片alt属性测试（使图片加载失败显示占位图）')
        .fontSize(12)
        .margin({ bottom: 10 })

      Row() {
        Column() {
          Text('资源占位图')
            .fontSize(10)
          Image('invalid_path_1.jpg')
            .width(80)
            .height(80)
            .id('heif_alt_resource')
            .alt($r('app.media.icon'))
            .onError(() => {
              this.alt1Shown = true;
              this.addLog('资源图片加载失败，显示占位图');
            })
          Text(this.alt1Shown ? '✓' : '...')
            .fontSize(10)
        }.margin({ right: 10 })

        Column() {
          Text('网络占位图')
            .fontSize(10)
          Image('invalid_path_2.jpg')
            .width(80)
            .height(80)
            .id('heif_alt_network')
            .onError(() => {
              this.alt2Shown = true;
              this.addLog('网络占位图不支持');
            })
          Text(this.alt2Shown ? '✓' : '...')
            .fontSize(10)
        }.margin({ right: 10 })

        Column() {
          Text('本地占位图')
            .fontSize(10)
          Image('invalid_path_3.jpg')
            .width(80)
            .height(80)
            .id('heif_alt_local')
            .alt($r('app.media.icon'))
            .onError(() => {
              this.alt3Shown = true;
              this.addLog('本地图片加载失败，显示占位图');
            })
          Text(this.alt3Shown ? '✓' : '...')
            .fontSize(10)
        }
      }.margin({ bottom: 10 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Text('1. 设置alt为引用heif格式资源图片\n2. 设置alt为heif格式网络图片\n3. 设置alt为heif格式本地图片\n预期: 图片不显示，执行onError回调并显示占位图')
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

