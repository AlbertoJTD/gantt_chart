require "test_helper"

class GanttChartControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gantt_chart_index_url
    assert_response :success
  end
end
