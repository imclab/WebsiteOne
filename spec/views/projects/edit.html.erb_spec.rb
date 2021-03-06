require 'spec_helper'

describe 'projects/edit.html.erb' do
  before :each do
    @project = Project.create(id: 1, title: "Title 1", description: "Description 1", status: "Status 1")

    assign(:project, @project)
  end

  it 'renders project form labels' do
    render

    expect(rendered).to have_text('Title')
    expect(rendered).to have_text('Description')
    expect(rendered).to have_text('GitHub link')
    expect(rendered).to have_text('PivotalTracker link')
    expect(rendered).to have_text('Status')
  end

  it 'renders project form fields' do
    render

    expect(rendered).to have_field('Title')
    expect(rendered).to have_field('Description')
    expect(rendered).to have_field('GitHub link')
    expect(rendered).to have_field('PivotalTracker link')
    expect(rendered).to have_field('Status')
  end

  it 'renders Submit button' do
    render
    rendered.should have_button('Submit')
  end

  it 'renders Back button' do
    render
    rendered.should have_link('Back', :href => project_path(@project))
  end

end
