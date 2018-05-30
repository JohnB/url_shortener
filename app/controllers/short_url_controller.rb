class ShortUrlController < ApplicationController
  def view
    some_short_code = params[:some_short_code]
    short_url = ShortenedUrl.find_by_short_url(some_short_code)

    redirect_to short_url ? short_url.long_url : '/404'
  end
end
