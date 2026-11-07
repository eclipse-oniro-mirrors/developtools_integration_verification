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

@Entry
@Component
struct UiComponentTextRichEditorOnHover00003 {
  controller: RichEditorController = new RichEditorController();
  infoController: RichEditorController = new RichEditorController();
  @State hoverTrueCount: number = 0;
  @State hoverFalseCount: number = 0;
  @State currentStatus: string = '等待触发';
  @State lastEventTime: string = '--';
  @State eventHistory: string[] = [];

  aboutToAppear() {
    this.updateInfoDisplay();
  }

  updateInfoDisplay() {
    this.infoController.deleteSpans();
    
    // 标题
    this.infoController.addTextSpan('【测试说明】onHover (true/false)事件触发测试\n', {
      style: {
        fontSize: 15,
        fontColor: '#1F7CE8',
        fontWeight: FontWeight.Bold
      }
    });
    
    // 测试步骤
    this.infoController.addTextSpan('步骤1: 鼠标移到图片中心区域(偏移50px)，查看onHover(true)回调\n', {
      style: {
        fontSize: 13,
        fontColor: '#333333'
      }
    });
    this.infoController.addTextSpan('预期: 触发onHover(true)\n', {
      style: {
        fontSize: 13,
        fontColor: '#F59E0B',
        fontWeight: FontWeight.Bold
      }
    });
    
    // 分隔线
    this.infoController.addTextSpan('━━━━━━━━━━━━━━━━━━━━━━\n', {
      style: {
        fontSize: 12,
        fontColor: '#CCCCCC'
      }
    });
    
    // 事件统计
    this.infoController.addTextSpan('【事件统计】\n', {
      style: {
        fontSize: 14,
        fontColor: '#FF6B00',
        fontWeight: FontWeight.Bold
      }
    });
    this.infoController.addTextSpan('✓ onHover(true)次数: ' + this.hoverTrueCount + '\n', {
      style: {
        fontSize: 13,
        fontColor: '#00A870',
        fontWeight: FontWeight.Bold
      }
    });
    this.infoController.addTextSpan('✗ onHover(false)次数: ' + this.hoverFalseCount + '\n', {
      style: {
        fontSize: 13,
        fontColor: '#FF4D4F',
        fontWeight: FontWeight.Bold
      }
    });
    this.infoController.addTextSpan('当前状态: ' + this.currentStatus + '\n', {
      style: {
        fontSize: 13,
        fontColor: '#8B5CF6',
        fontWeight: FontWeight.Bold
      }
    });
    this.infoController.addTextSpan('最后触发时间: ' + this.lastEventTime, {
      style: {
        fontSize: 12,
        fontColor: '#666666'
      }
    });
    
    // 事件历史
    if (this.eventHistory.length > 0) {
      this.infoController.addTextSpan('\n事件序列: ' + this.eventHistory.join(' → '), {
        style: {
          fontSize: 11,
          fontColor: '#999999'
        }
      });
    }
  }

  build() {
    Column({ space: 12 }) {
      // 标题栏
      Text('onHover (true/false)事件触发测试')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor('#1F7CE8')
        .width('100%')
        .textAlign(TextAlign.Center)
        .margin({ top: 5, bottom: 5 })

      // 信息展示区域
      RichEditor({ controller: this.infoController })
        .id('rich_editor_onhover_00003_info')
        .width('100%')
        .height(200)
        .backgroundColor('#FFFFFF')
        .border({ width: 1, color: '#E0E0E0' })
        .borderRadius(8)
        .padding(12)

      // 操作按钮区域
      Row({ space: 10 }) {
        Button('添加图文混排内容')
          .id('button_onhover_00003_add_content')
          .fontSize(13)
          .flexGrow(1)
          .backgroundColor('#1F7CE8')
          .onClick(() => {
            this.controller.deleteSpans();
            // 图片放到最前面
            this.controller.addImageSpan($r('sys.media.ohos_app_icon'), {
              imageStyle: {
                size: [100, 100],
                layoutStyle: {
                  margin: { left: 8, right: 8 }
                }
              }
            });
            this.controller.addTextSpan(' 后置文本', {
              style: {
                fontSize: 15
              }
            });
            
            this.currentStatus = '内容已添加(图片100x100在最前)，请测试';
            this.updateInfoDisplay();
          })

        Button('重置测试')
          .id('button_onhover_00003_reset')
          .fontSize(13)
          .flexGrow(1)
          .backgroundColor('#FF6B00')
          .onClick(() => {
            this.controller.deleteSpans();
            this.hoverTrueCount = 0;
            this.hoverFalseCount = 0;
            this.currentStatus = '已重置';
            this.lastEventTime = '--';
            this.eventHistory = [];
            this.updateInfoDisplay();
          })
      }
      .width('95%')

      // 测试区域标签
      Text('【测试区域】请将鼠标移入和移出此RichEditor')
        .fontSize(12)
        .fontColor('#666666')
        .width('100%')
        .textAlign(TextAlign.Start)
        .margin({ top: 5 })

      // RichEditor测试组件
      RichEditor({ controller: this.controller })
        .id('rich_editor_onhover_00003')
        .width('100%')
        .height(180)
        .backgroundColor('#F8F9FA')
        .border({ width: 2, color: '#1F7CE8', style: BorderStyle.Dashed })
        .borderRadius(8)
        .padding(12)
        .onHover((isHover: boolean, event: HoverEvent) => {
          // 更新计数
          if (isHover) {
            this.hoverTrueCount++;
            this.currentStatus = '✓ 鼠标进入 (true)';
            this.eventHistory.push('true');
          } else {
            this.hoverFalseCount++;
            this.currentStatus = '✗ 鼠标离开 (false)';
            this.eventHistory.push('false');
          }
          
          // 只保留最近6个事件
          if (this.eventHistory.length > 6) {
            this.eventHistory.shift();
          }
          
          // 更新时间戳
          this.lastEventTime = new Date(event.timestamp / 1000000).toLocaleTimeString();
          
          // 刷新信息显示
          this.updateInfoDisplay();
        })
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .backgroundColor('#F0F2F5')
  }
}
