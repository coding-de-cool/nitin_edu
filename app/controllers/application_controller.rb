class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  # Sets the flash message with :key, using I18n. By default you are able
  # to set up your messages using specific resource scope, and if no message is
  # found we look to the default scope. Set the "now" options key to a true
  # value to populate the flash.now hash in lieu of the default flash hash (so
  # the flash message will be available to the current action instead of the
  # next action).
  # Example (i18n locale file):
  #
  #   en:
  #     users:
  #       create:
  #         signed_up: #flash message
  #
  # Please refer to en.yml locale file to check what messages are
  # available.
  def set_flash_message(key, kind, options = {})
    message = find_message(kind, options)
    if options[:now]
      flash.now[key] = message if message.present?
    else
      flash[key] = message if message.present?
    end
  end

  # Get message for given
  def find_message(kind, options = {})
    options[:resource_name] ||= controller_name
    options[:action_name] ||= action_name
    I18n.t("#{options[:resource_name]}.#{options[:action_name]}.#{kind}", options)
  end

end
